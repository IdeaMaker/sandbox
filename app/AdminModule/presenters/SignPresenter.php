<?php
namespace AdminModule;
use Nette\Application\UI;
use Nette\Diagnostics\Debugger;


/**
 * Sign in/out presenters.
 */
class SignPresenter extends \BasePresenter
{
    protected function beforeRender()
    {
        parent::beforeRender();
        $this->setLayout('admin');
    }


    /**
	 * Sign-in form factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSignInForm()
	{
        $form = new UI\Form;
        $form->addText('username', 'Uživatelské jméno:')
            ->setRequired('Zadejte uživatelské jméno.');

        $form->addPassword('password', 'Heslo:')
            ->setRequired('Zadejte heslo.');

        $form->addCheckbox('remember', 'Pamatovat');

        $form->addSubmit('send', 'Přihlásit');

        // call method signInFormSucceeded() on success
        $form->onSuccess[] = $this->signInFormSucceeded;
        return $form;
	}



	public function signInFormSucceeded($form)
	{
		$values = $form->getValues();

		if ($values->remember) {
			$this->getUser()->setExpiration('14 days', FALSE);
		} else {
			$this->getUser()->setExpiration('20 minutes', TRUE);
		}

		try {
			$this->getUser()->login($values->username, $values->password);
            $section = $this->context->session->getSection("KCFINDER");
            $section->KCFINDER = array();
            $section->KCFINDER['disabled']=false;
			$this->redirect(':Admin:Dashboard:default');
			
		} catch (\Nette\Security\AuthenticationException $e) {
			$form->addError($e->getMessage());
		}
	}



	public function actionOut()
	{
		$this->getUser()->logout();
        $section = $this->context->session->getSection("KCFINDER");
        $section->remove();
		$this->flashMessage('Byl jste odhlášen.');
		$this->redirect('in');
	}

}
