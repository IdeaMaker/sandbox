<?php
namespace AdminModule;
use \AdminModule\Components\Grids\StaticPageGrid;
use IdeaMaker\Admin\Forms\StaticpageForm;
use IdeaMaker\Facades\StaticPageFacade;
use Nette\Diagnostics\Debugger;

class StaticPagePresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\StaticPageGrid
     * @inject
     */
    protected $grid;

    /**
     * @param \AdminModule\Components\Grids\StaticPageGrid $staticPageGrid
     */
    public function injectStaticPageGrid(StaticPageGrid $staticPageGrid)
    {
        $this->grid = $staticPageGrid;
    }

    public function injectStaticPageFacade(StaticPageFacade $staticPageFacade)
    {
        $this->staticpageFacade = $staticPageFacade;
    }

    /**
     * @var StaticpageForm
     */
    protected $form;

    /**
     * @var StaticPageFacade
     * @inject
     */
    protected $staticpageFacade;

    public function createComponentStaticpageForm()
    {
        $this->form = new StaticpageForm($this, 'staticpageForm', $this->staticpageFacade);

        return $this->form;
    }

    public function createComponentGrid()
    {
        return $this->grid;
    }

	public function renderDefault()
	{

	}

    public function renderEdit($id)
    {
        $languages = $this->context->parameters['languages'];
        foreach ($languages as $language) {
            $staticpageLang = $this->staticpageFacade->getLangTable()->where(array('staticPage_id'=>$id, 'lang'=>$language))->fetch();
            $_data = $staticpageLang->toArray();
            foreach ($_data as $key=>$value) {
                $data[$key.'_'.$language] = $value;
            }

        }
        $staticpage = $this->staticpageFacade->find($id)->fetch();
        $data = array_merge($staticpage->toArray(), $data);

        if ($data) {


            $form = $this->form ? $this->form : $this->createComponentStaticpageForm();
            $form->setValues($data);

        }else {
            throw new InvalidArgumentException;
        }
    }

    public function renderDelete($id)
    {
        try {
            $this->staticpageFacade->delete($id);
            $this->flashMessage('Stránka byla smazáná.');
        } catch (\Exception $e) {
            echo $e;
            exit;
        }
        $this->redirect('default');

    }

}
