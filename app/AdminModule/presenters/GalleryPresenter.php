<?php
namespace AdminModule;
use AdminModule\Components\Grids\GalleryGrid;
use Echo511\Plupload\Rooftop;
use IdeaMaker\Admin\Forms\GalleryForm;
use IdeaMaker\Facades\GalleryFacade;
use Nette\Diagnostics\Debugger;
use Nette\Environment;
use Nette\Http\FileUpload;
use Nette\InvalidArgumentException;

if (!defined('WWW_DIR')) {
    define('WWW_DIR',dirname(dirname(dirname(__DIR__))).'/web');
}

class GalleryPresenter extends BasePresenter
{

    /**
     * @var \AdminModule\Components\Grids\GalleryGrid
     * @inject
     */
    protected $grid;

    /**
     * @var \IdeaMaker\Admin\Forms\GalleryForm
     */
    protected $form;

    /**
     * @var GalleryFacade
     */
    protected $galleryFacade;

    /**
     * @param \AdminModule\Components\Grids\GalleryGrid $galleryGrid
     */
    public function injectGalleryGrid(GalleryGrid $galleryGrid)
    {
        $this->grid = $galleryGrid;
    }

    public function injectGalleryFacade(GalleryFacade $galleryFacade)
    {
        $this->galleryFacade = $galleryFacade;
    }

    // COMPONENTS

    public function createComponentGrid()
    {
        return $this->grid;
    }

    public function createComponentGalleryForm()
    {
        $this->form = new GalleryForm($this, 'galleryForm', $this->galleryFacade);

        return $this->form;
    }
    // ACTIONS

	public function renderDefault()
	{

	}

    public function actionEdit($id)
    {

        $this->id = $id;
        if (!is_dir($galleryDir = WWW_DIR . '/upload/images/gallery/'.$this->id)) {
            mkdir($galleryDir);
        }
        $gallery = $this->galleryFacade->find($id);
        if ($gallery) {
            $galleryData = $gallery->fetch();
            $form = $this->form ? $this->form : $this->createComponentGalleryForm();
            $form->setValues($galleryData);
            Debugger::barDump($galleryData);
        }else {
            throw new InvalidArgumentException;
        }
    }


    public $id;

    public function createComponentPlupload()
    {
        Debugger::barDump(WWW_DIR);
        // Main object
        $uploader = new Rooftop();

        // Use magic for loading Js and Css?
        // $uploader->disableMagic();

        // Configuring paths
        $uploader->setWwwDir(WWW_DIR) // Full path to your frontend directory
            ->setBasePath($this->template->basePath) // BasePath provided by Nette
            ->setTempLibsDir(WWW_DIR . '/plupload511/test'); // Full path to the location of plupload libs (js, css)

        // Configuring plupload
        $uploader->createSettings()
            ->setRuntimes(array('html5', 'gears', 'flash', 'silverlight', 'browserplus')) // Available: gears, flash, silverlight, browserplus, html5
            ->setMaxFileSize('1000mb')
            ->setMaxChunkSize('2mb'); // What is chunk you can find here: http://www.plupload.com/documentation.php

        // Configuring uploader
        $uploader->createUploader()
            ->setTempUploadsDir(WWW_DIR . '/plupload511/tempDir') // Where should be placed temporaly files
            ->setToken("ahoj") // Resolves file names collisions in temp directory
            ->setOnSuccess(array($this, 'processFileUpload')); // Callback when upload is successful: returns Nette\Http\FileUpload

        return $uploader->getComponent();
    }

    public function processFileUpload(FileUpload $upload)
    {

        // zde uložit upload do session - jako token použít $this->instance.
        // naplnit formulář ze session
        // překreslit formulář
    }

    public function renderNew()
    {

    }

    public function renderDelete($id)
    {
        try {
            $this->galleryFacade->delete($id);
            $this->flashMessage('Položka byla smazána.');
        } catch (\Exception $e) {

        }
        $this->redirect('default');

    }

}
