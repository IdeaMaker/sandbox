<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\UserFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class UserForm extends BaseForm
{
    /**
     * @var UserFacade
     */
    protected $userFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'userForm', UserFacade $staticpageFacade)
    {
        parent::__construct($parent, $name);
        $this->userFacade = $staticpageFacade;
        $this->addGroup('Základní údaje');

        $this->addText('name', 'Jméno')
            ->addRule(Form::FILLED, 'Je nutné zadat jméno.')
        ;
        $this->addText('user', 'Uživatelské jméno')
            ->addRule(Form::FILLED, 'Je nutné zadat text uživatelské jméno.')
        ;
        if ($this->presenter->getUser()->isInRole('admin') OR $this->presenter->getParameter('id') == $this->presenter->getUser()->getId()) {
            $this->addPassword('password', 'Heslo')
                ->addRule(Form::FILLED, 'Je nutné zadat heslo.')
            ;
            $this->addPassword('password_confirm', 'Heslo (ověření)')
                ->addRule(Form::FILLED, 'Je nutné zadat heslo pro ověření.')
                ->addRule(Form::EQUAL, 'Zadaná hesla se musejí shodovat.', $this['password'])
            ;
        }
        if ($this->presenter->getUser()->isInRole('admin')) {
            $this->addGroup('Zabezpečení');
            $this->addRadioList('role', 'Role', array('admin'=>'admin', 'editor'=>'editor'));
        }
        $this->addHidden('id');
        $this->addSubmit('save', 'Uložit');
        $this->onSuccess[] = callback($this, 'onSuccess');

    }

    protected function prepareForm()
    {

    }

    public function onSuccess(\Nette\Application\UI\Form $form)
    {
        $userValues = $form->getValues();
        unset($userValues['password_confirm']);
        try {
            $savedId = $this->userFacade->save($userValues);
            if ($userValues['id']) { // protoze update vraci pocet zasazenych radku ne ID :(
                $savedId = $userValues['id'];
            }
            $this->presenter->flashMessage('Záznam byl uložen.');
            $this->presenter->redirect('edit?id='.$savedId);
        } catch (\PDOException $e) {
            if ($e->getCode() == 23000 and $e->errorInfo[1] == 1062) {
                $this->presenter->flashMessage('Zadané uživatelské jméno již existuje.', 'error');
                $this->presenter->redirect('this');
            }

        }

    }



}