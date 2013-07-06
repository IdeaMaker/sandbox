<?php
namespace AdminModule;
use AdminModule\Components\Grids\PrintGrid;
use IdeaMaker\Admin\Forms\PrintForm;
use IdeaMaker\Facades\PrintFacade;
use Nette\Diagnostics\Debugger;
use Nette\InvalidArgumentException;

class PrintPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\PrintGrid
     * @inject
     */
    protected $grid;

    /**
     * @var \IdeaMaker\Admin\Forms\PrintForm
     */
    protected $form;

    /**
     * @var PrintFacade
     */
    protected $printFacade;

    /**
     * @param PrintGrid $printGrid
     */
    public function injectCategoryGrid(PrintGrid $printGrid)
    {
        $this->grid = $printGrid;
    }

    public function injectCategoryFacade(PrintFacade $printFacade)
    {
        $this->printFacade = $printFacade;
    }

    // COMPONENTS

    public function createComponentGrid()
    {
        return $this->grid;
    }

    public function createComponentPrintForm()
    {
        $this->form = new PrintForm($this, 'printForm', $this->printFacade);

        return $this->form;
    }
    // ACTIONS

	public function renderDefault()
	{

	}

    public function renderEdit($id)
    {
        if (!($this->presenter->getUser()->isInRole('admin'))) { // neni admin
            $this->flashMessage('Nemáte dostatečné oprávnení', 'error');
            $this->redirect('Dashboard:');
        }
        $print = $this->printFacade->find($id);
        if ($print) {
            $printData = $print->fetch();
            $form = $this->form ? $this->form : $this->createComponentPrintForm();
            $form->setValues($printData);
            Debugger::barDump($printData);
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
            $this->printFacade->delete($id);
            $this->flashMessage('Tiskové medium bylo smazáno.');
        } catch (\Exception $e) {

        }
        $this->redirect('default');

    }

}
