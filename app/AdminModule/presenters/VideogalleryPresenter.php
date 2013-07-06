<?php
namespace AdminModule;
use AdminModule\Components\Grids\VideogalleryGrid;
use IdeaMaker\Admin\Forms\VideogalleryForm;
use IdeaMaker\Facades\VideogalleryFacade;
use Nette\Diagnostics\Debugger;
use Nette\InvalidArgumentException;

class VideogalleryPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\VideogalleryGrid
     * @inject
     */
    protected $grid;

    /**
     * @var \IdeaMaker\Admin\Forms\VideogalleryForm
     */
    protected $form;

    /**
     * @var VideogalleryFacade
     */
    protected $videogalleryFacade;

    /**
     * @param \AdminModule\Components\Grids\VideogalleryGrid $videogalleryGrid
     */
    public function injectVideogalleryGrid(VideogalleryGrid $videogalleryGrid)
    {
        $this->grid = $videogalleryGrid;
    }

    public function injectVideogalleryFacade(VideogalleryFacade $videogalleryFacade)
    {
        $this->videogalleryFacade = $videogalleryFacade;
    }

    // COMPONENTS

    public function createComponentGrid()
    {
        return $this->grid;
    }

    public function createComponentVideogalleryForm()
    {
        $this->form = new VideogalleryForm($this, 'videogalleryForm', $this->videogalleryFacade);

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
        $videogallery = $this->videogalleryFacade->find($id);
        if ($videogallery) {
            $videogalleryData = $videogallery->fetch();
            $form = $this->form ? $this->form : $this->createComponentVideogalleryForm();
            $form->setValues($videogalleryData);
            Debugger::barDump($videogalleryData);
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
            $this->videogalleryFacade->delete($id);
            $this->flashMessage('Videogalerie byla smazána.');
        } catch (\Exception $e) {

        }
        $this->redirect('default');

    }

}
