<?php
namespace AdminModule;
use \AdminModule\Components\Grids\ActualityGrid;
use IdeaMaker\Admin\Forms\ActualityForm;
use IdeaMaker\Facades\ActualityFacade;
use Nette\Diagnostics\Debugger;
use Nette\InvalidArgumentException;

class ActualityPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\StaticPageGrid
     * @inject
     */
    protected $grid;

    /**
     * @param \AdminModule\Components\Grids\ActualityGrid $actualityGrid
     */
    public function injectStaticPageGrid(ActualityGrid $actualityGrid)
    {
        $this->grid = $actualityGrid;
    }

    public function injectStaticPageFacade(ActualityFacade $actualityFacade)
    {
        $this->actualityFacade = $actualityFacade;
    }

    /**
     * @var ActualityForm
     */
    protected $form;

    /**
     * @var ActualityFacade
     * @inject
     */
    protected $actualityFacade;

    public function createComponentActualityForm()
    {
        $this->form = new ActualityForm($this, 'actualityForm', $this->actualityFacade);

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
            $staticpageLang = $this->actualityFacade->getLangTable()->where(array('actuality_id'=>$id, 'lang'=>$language))->fetch();
            $_data = $staticpageLang->toArray();
            foreach ($_data as $key=>$value) {
                $data[$key.'_'.$language] = $value;
            }

        }
        $staticpage = $this->actualityFacade->find($id)->fetch();
        $data = array_merge($staticpage->toArray(), $data);

        if ($data) {


            $form = $this->form ? $this->form : $this->createComponentActualityForm();
            $form->setValues($data);

        }else {
            throw new InvalidArgumentException;
        }
    }

    public function renderDelete($id)
    {
        try {
            $this->actualityFacade->delete($id);
            $this->flashMessage('Novinka byla smazáná.');
        } catch (\Exception $e) {
            echo $e;
            exit;
        }
        $this->redirect('default');

    }

}
