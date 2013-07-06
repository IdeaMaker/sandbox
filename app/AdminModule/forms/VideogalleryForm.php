<?php
namespace IdeaMaker\Admin\Forms;

use IdeaMaker\Facades\VideogalleryFacade;
use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;

class VideogalleryForm extends BaseForm
{
    /**
     * @var VideogalleryFacade
     */
    protected $videogalleryFacade;
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'videogalleryForm', VideogalleryFacade $videogalleryFacade)
    {
        parent::__construct($parent, $name);
        $this->videogalleryFacade = $videogalleryFacade;
        $this->addText('url', 'URL videa')
            ->addRule(Form::FILLED, 'Je nutné zadat URL.')
            ->addRule(Form::URL, 'Musí být URL.')
        ;
        $this->addText('title', 'Titulek videa')
            ->addRule(Form::FILLED, 'Je nutné zadat titulek videa.')
        ;
        $this->addUpload('image', 'Náhled videa')
//            ->addRule(Form::FILLED, 'Vložte náhled videa.')
            ->addConditionOn($this['image'], Form::FILLED)
                ->addRule(Form::MAX_FILE_SIZE, 'Maximálni velikost souboru je 2MB.', 2*1024*1024)
                ->addRule(Form::IMAGE, 'Musí být obrázek')
        ;
        $this->addCheckbox('is_active', 'Aktivní')->setDefaultValue(true);

        $this->addHidden('id');
        $this->addSubmit('save', 'Uložit');
        $this->onSuccess[] = callback($this, 'onSuccess');

    }

    protected function prepareForm()
    {

    }

    public function onSuccess(\Nette\Application\UI\Form $form)
    {
        $videogalleryValues = $form->getValues();

        try {
            $savedId = $this->videogalleryFacade->save($videogalleryValues);
            if (isset($videogalleryValues['id'])) {
                $savedId = $videogalleryValues['id'];
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