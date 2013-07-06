<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\StaticPageFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class StaticpageForm extends BaseForm
{
    /**
     * @var StaticPageFacade
     */
    protected $staticpageFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'staticForm', StaticPageFacade $staticpageFacade)
    {
        parent::__construct($parent, $name);

        $languages = $parent->context->parameters['languages'];
        $this->staticpageFacade = $staticpageFacade;
        $this->addGroup('Základní údaje');

        $parentStaticPagesIds = array_keys($this->staticpageFacade->findBy(array('parent_id IS NULL'))->fetchPairs('id'));

        $this->addCheckbox('is_active', 'Aktívni');
        $this->addCheckbox('display_page', 'Zobrazovat obsah stránky (pokud ne funguje jako rodič)');

        $parents = $this->staticpageFacade->getLangTable()->where(array('lang'=>$this->presenter->lang, 'staticPage_id'=>$parentStaticPagesIds))->fetchPairs('staticPage_id', 'title');
        $parents[0] = 'Vyberte nadřaz. stránku';
        ksort($parents);
        $this->addSelect('parent_id', 'Nadřazená stránka', $parents);
        $this->addText('order', 'Řazení')->setDefaultValue(1000)
            ->addRule(Form::INTEGER, 'Musí být číslo.')
        ;

        foreach ($languages as $language) {
        $this->addGroup('Obsah '.$language)->setOption('class', 'toggle-first');
        $this->addTextArea('keywords_'.$language, 'Klíčové slova')
        ;
        $this->addTextArea('description_'.$language, 'Popis stránky');
        $this->addText('title_'.$language, 'Titulek')

            ->addRule(Form::FILLED, 'Je nutné zadat titulek.')
        ;
        $this->addText('slug_'.$language, 'SEO URL')

            ->addRule(Form::FILLED, 'Je nutné zadat SEO URL.')
        ;
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
        $staticpageValues = $form->getValues();
        try {
            $savedId = $this->staticpageFacade->save($staticpageValues);
            if (@$staticpageValues['id']) {
                $savedId = $staticpageValues['id'];
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