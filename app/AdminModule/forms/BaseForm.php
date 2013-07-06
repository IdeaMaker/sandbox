<?php
namespace IdeaMaker\Admin\Forms;
use \Nette\Application\UI\Form;
use Nette\ComponentModel;
use Kdyby\BootstrapFormRenderer\BootstrapRenderer;

abstract class BaseForm extends Form
{
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = NULL)
    {
        parent::__construct($parent, $name);
        $this->setRenderer(new BootstrapRenderer);
    }

}