<?php
namespace AdminModule;
use AdminModule\Components\Grids\UserGrid;
use IdeaMaker\Admin\Forms\UserForm;
use IdeaMaker\Facades\UserFacade;
use Nette\Diagnostics\Debugger;
use Nette\InvalidArgumentException;

class UserPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\UserGrid
     * @inject
     */
    protected $grid;

    /**
     * @var \IdeaMaker\Admin\Forms\UserForm
     */
    protected $form;

    /**
     * @var UserFacade
     */
    protected $userFacade;

    /**
     * @param \AdminModule\Components\Grids\UserGrid $userGrid
     */
    public function injectUserGrid(UserGrid $userGrid)
    {
        $this->grid = $userGrid;
    }

    public function injectUserFacade(UserFacade $userFacade)
    {
        $this->userFacade = $userFacade;
    }

    // COMPONENTS

    public function createComponentGrid()
    {
        return $this->grid;
    }

    public function createComponentUserForm()
    {
        $this->form = new UserForm($this, 'userForm', $this->userFacade);

        return $this->form;
    }
    // ACTIONS

	public function renderDefault()
	{

	}

    public function renderEdit($id)
    {
        if (!($this->presenter->getUser()->isInRole('admin') OR $this->presenter->getUser()->getId() == $id)) { // neni admin ani to neni jeho ucet
            $this->flashMessage('Nemáte dostatečné oprávnení', 'error');
            $this->redirect('Dashboard:');
        }
        $user = $this->userFacade->find($id);
        if ($user) {
            $userData = $user->fetch();
            unset($userData['password']);
            $form = $this->form ? $this->form : $this->createComponentUserForm();
            $form->setValues($userData);
            $form['name']->setAttribute('readonly');
            $form['user']->setAttribute('readonly');
            Debugger::barDump($userData);
        }else {
            throw new InvalidArgumentException;
        }
    }

    public function renderNew()
    {

    }

    public function renderDelete($id)
    {
        try {
            $this->userFacade->delete($id);
            $this->flashMessage('Uživatel byl smazán.');
        } catch (\Exception $e) {

        }
        $this->redirect('default');

    }

}
