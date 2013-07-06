<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\ActualitFacade;
use IdeaMaker\Facades\ActualityFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class ActualityForm extends BaseForm
{
    /**
     * @var StaticPageFacade
     */
    protected $actualityFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'staticForm', ActualityFacade $actualityFacade)
    {
        parent::__construct($parent, $name);

        $languages = $parent->context->parameters['languages'];
        $this->actualityFacade = $actualityFacade;
        $this->addGroup('Základní údaje');



        $this->addCheckbox('is_active', 'Aktívni');
        $this->addUpload('image', 'Úvodní obrázek')
            ->addCondition(Form::FILLED)
            ->addRule(Form::MIME_TYPE, 'Povolené formáty fotografií jsou pouze JPEG nebo JPG', 'image/jpeg')
            ->addRule(Form::MAX_FILE_SIZE, 'Fotografie nesmí být větší než 1MB', 1*1024*1024)
        ;

        foreach ($languages as $language) {
        $this->addGroup('Obsah '.$language)->setOption('class', 'toggle-first');

        ;
        $this->addText('title_'.$language, 'Titulek')

            ->addRule(Form::FILLED, 'Je nutné zadat titulek.')
        ;
        $this->addText('slug_'.$language, 'SEO URL')

            ->addRule(Form::FILLED, 'Je nutné zadat SEO URL.')
        ;
        $this->addTextArea('perex_'.$language, 'Perex');
        $this->addTextArea('content_'.$language, 'Obsah')
            ->getControlPrototype()->addAttributes(array('class'=>'ckeditor'))
        ;
        }

        $this->addHidden('id');
        $this->addHidden('lang', $this->presenter->lang);
        $this->addGroup('');
        $this->addSubmit('save', 'Uložit');
        $this->onSuccess[] = callback($this, 'onSuccess');

    }

    protected function prepareForm()
    {

    }

    public function onSuccess(\Nette\Application\UI\Form $form)
    {
        $actualityValues = $form->getValues();
        try {

            $savedId = $this->actualityFacade->save($actualityValues);
            if (@$actualityValues['id']) {
                $savedId = $actualityValues['id'];
            }
            $this->presenter->flashMessage('Záznam byl uložen.');
            $this->presenter->redirect('edit?id='.$savedId);
        } catch (\PDOException $e) {
            if ($e->getCode() == 23000 and $e->errorInfo[1] == 1062) {
                $this->presenter->flashMessage('Zadaná URL již existuje.', 'error');
//                $this->presenter->redirect('this');
            } else {
                throw $e;
            }

        } catch (\Exception $e) {
            throw $e;
        }


    }



}