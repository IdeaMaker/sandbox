<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\GalleryFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class GalleryForm extends BaseForm
{
    /**
     * @var galleryFacade
     */
    protected $galleryFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'galleryForm', GalleryFacade $galleryFacade)
    {
        parent::__construct($parent, $name);
        $this->galleryFacade = $galleryFacade;
        $this->addGroup('Základní údaje');

        $this->addText('name', 'Název')
            ->addRule(Form::FILLED, 'Je nutné zadat název.')
        ;

        $this->addHidden('id');
        $this->addSubmit('save', 'Uložit');
        $this->onSuccess[] = callback($this, 'onSuccess');

    }

    protected function prepareForm()
    {

    }

    public function onSuccess(\Nette\Application\UI\Form $form)
    {
        $galleryValues = $form->getValues();

//        try {
            $savedId = $this->galleryFacade->save($galleryValues);
            if (@$galleryValues['id']) {
                $savedId = $galleryValues['id'];
            }
            $this->presenter->flashMessage('Záznam byl uložen.');
            $this->presenter->redirect('edit?id='.$savedId);
//        } catch (\PDOException $e) {
//            if ($e->getCode() == 23000 and $e->errorInfo[1] == 1062) {
//                $this->presenter->flashMessage('Zadaná URL již existuje.', 'error');
//                $this->presenter->redirect('this');
//            }
//
//        }

    }



}