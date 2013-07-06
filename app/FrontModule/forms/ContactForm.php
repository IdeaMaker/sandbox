<?php
namespace IdeaMaker\Frontend\Forms;

use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;
use Nette\Mail\Message;

class ContactForm extends BaseForm
{
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'contactForm')
    {
        parent::__construct($parent, $name);
        $this->addGroup('Kontaktujte nás:');

        $this->addText('name', 'Vaše jméno:')
            ->addRule(Form::FILLED, 'Je nutné zadat Vasše jméno.')
        ;
        $this->addText('phone', 'Telefon:')
            ->addRule(Form::FILLED, 'Je nutné zadat telefon.')
        ;
        $this->addText('email', 'Email:')
            ->addRule(Form::EMAIL, 'Musí být email.')
            ->addRule(Form::FILLED, 'Je nutné zadat email.')
        ;

        $this->addTextArea('message', 'Zpráva:')
            ->addRule(Form::FILLED, 'Je nutné zadat zprávu.')
        ;


        $this->addHidden('id');
        $this->addHidden('page_title', 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
        $this->addSubmit('save', 'Odeslat');
        $this->onSuccess[] = callback($this, 'onSuccess');

    }

    protected function prepareForm()
    {

    }




    public function onSuccess(\Nette\Application\UI\Form $form)
    {
        $values = $form->getValues();
        $message = new Message();
        $message->addTo('vladimir.polak.ml@gmail.com');
        $message->addTo('josef.rybak@gmail.com');
        $message->from = 'Kontaktní formulář - pello.cz <no-reply@pello.cz>';
        $message->addReplyTo($values->email, $values->name);
        $message->subject = 'Dotaz z www.pello.cz - Kontaktní formulář';
        $message->body = "
Kontaktní formulář:

Jméno: $values->name
Telefon: $values->phone
Email: $values->email
URL: $values->page_title

Zpráva:
$values->message
";

        $message->send();
        $this->presenter->flashMessage('Vaše zpráva byla odeslána. Děkujeme.');
        $this->presenter->redirect('this');


    }



}