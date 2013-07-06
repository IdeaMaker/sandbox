<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\CategoryFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class CategoryForm extends BaseForm
{
    /**
     * @var CategoryFacade
     */
    protected $categoryFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'categoryForm', CategoryFacade $staticpageFacade)
    {
        parent::__construct($parent, $name);
        $this->categoryFacade = $staticpageFacade;
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
        $categoryValues = $form->getValues();

        try {
            $savedId = $this->categoryFacade->save($categoryValues);
            if ($categoryValues['id']) {
                $savedId = $categoryValues['id'];
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