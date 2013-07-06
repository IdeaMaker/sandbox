<?php
namespace AdminModule;
use AdminModule\Components\Grids\CategoryGrid;
use IdeaMaker\Admin\Forms\CategoryForm;
use IdeaMaker\Facades\CategoryFacade;
use Nette\Diagnostics\Debugger;
use Nette\InvalidArgumentException;

class CategoryPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\CategoryGrid
     * @inject
     */
    protected $grid;

    /**
     * @var \IdeaMaker\Admin\Forms\CategoryForm
     */
    protected $form;

    /**
     * @var CategoryFacade
     */
    protected $categoryFacade;

    /**
     * @param \AdminModule\Components\Grids\CategoryGrid $categoryGrid
     */
    public function injectCategoryGrid(CategoryGrid $categoryGrid)
    {
        $this->grid = $categoryGrid;
    }

    public function injectCategoryFacade(CategoryFacade $categoryFacade)
    {
        $this->categoryFacade = $categoryFacade;
    }

    // COMPONENTS

    public function createComponentGrid()
    {
        return $this->grid;
    }

    public function createComponentCategoryForm()
    {
        $this->form = new CategoryForm($this, 'categoryForm', $this->categoryFacade);

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
        $category = $this->categoryFacade->find($id);
        if ($category) {
            $categoryData = $category->fetch();
            $form = $this->form ? $this->form : $this->createComponentCategoryForm();
            $form->setValues($categoryData);
            Debugger::barDump($categoryData);
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
            $this->categoryFacade->delete($id);
            $this->flashMessage('Kategorie byla smazána.');
        } catch (\Exception $e) {

        }
        $this->redirect('default');

    }

}
