<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\PrintFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class PrintForm extends BaseForm
{
    /**
     * @var PrintFacade
     */
    protected $printFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'printForm', PrintFacade $staticpageFacade)
    {
        parent::__construct($parent, $name);
        $this->printFacade = $staticpageFacade;
        $this->addGroup('Základní údaje');

        $this->addText('name', 'Název')
            ->addRule(Form::FILLED, 'Je nutné zadat název.')
        ;
        $this->addText('slug', 'SEO URL')
            ->addRule(Form::FILLED, 'Je nutné zadat SEO URL.')
        ;
        $this->addText('order', 'Řazení')
            ->addRule(Form::INTEGER, 'Musí být číslo.')
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
        $printValues = $form->getValues();

        try {
            $savedId = $this->printFacade->save($printValues);
            if ($printValues['id']) {
                $savedId = $printValues['id'];
            }
            $this->presenter->flashMessage('Záznam byl uložen.');
            $this->presenter->redirect('edit?id='.$savedId);
        } catch (\PDOException $e) {
            if ($e->getCode() == 23000 and $e->errorInfo[1] == 1062) {
                $this->presenter->flashMessage('Zadaná URL již existuje.', 'error');
                $this->presenter->redirect('this');
            }

        }

    }



}