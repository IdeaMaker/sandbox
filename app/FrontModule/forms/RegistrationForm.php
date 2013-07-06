<?php
namespace IdeaMaker\Frontend\Forms;

use Nette\Application\UI\Form;
use Nette\ComponentModel;
use Nette\Diagnostics\Debugger;
use Nette\Mail\Message;

class RegistrationForm extends BaseForm
{
    public function __construct(ComponentModel\IContainer $parent = NULL, $name = 'contactForm')
    {
        parent::__construct($parent, $name);

        $this->addText('title', 'Název filmu / Title of the film')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('title_en', 'Anglický překlad názvu / English title of the film')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('country', 'Země původu / Country of origin')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;

        $this->addText('year', 'Rok výroby / Year of production')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
//            ->addRule(Form::INTEGER, '')
//            ->addRule(Form::MIN_LENGTH, '', 4)
        ;

        $this->addText('producer', 'Výrobce / Producer')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('copyright', 'Majitel práv / Copyright origin')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('script','Scénář / Script')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('photography','Kamera / Photography')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('director','Režie / Director')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('language','Jazyk / Language')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('length','Stopáž / Length')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addSelect('medium', 'Dodaný nosič / Medium', array(
            'DVD', 'miniDV', 'DV', 'DV CAM', 'HDV', 'XD CAM', 'Betacam SP'
        ));

        $this->addTextArea('abstract','Anotace (bude použita v katalogu, max. 350 znaků) / Abstract (to be used in the Festival Catalogue, max. 350 characters)')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
//            ->addRule(Form::MAX_LENGTH, '',350)
        ;
        $this->addText('name','Jméno přihlašovatele / Applicant’s name')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('address','Adresa přihlašovatele / Applicant’s adress')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('phone','Telefon / Phone (with area code)')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('email','E-MAIL')
            ->addRule(Form::FILLED,'Toto pole je povinné / This field is required')
            ->addRule(Form::EMAIL, '')
        ;
        $this->addText('www','WWW')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('award_presented_to','Při ocenění přihlášeného filmu cenu převezme / If the film wins an award, the award will be presented to')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('award_presented_to_phone','TELEFON / PHONE (with area code)')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
        ;
        $this->addText('award_presented_to_email','E-MAIL')
            ->addRule(Form::FILLED, 'Toto pole je povinné / This field is required')
            ->addRule(Form::EMAIL,'')
        ;
        $this->addSelect('submit_for', 'Přihlašuji film do / I submit the above-mentioned film for', array(
            'Mezinárodní soutěž / International competition',
            'Informativní sekce / Informative screening'
        ));
        $this->addSelect('agree_noncomercial', 'Souhlasím s přepisem přihlášeného filmu na DVD pro nekomerční využití ve videotéce Harvest films o.s. a pro Ozvěny LIFE SCIENCES FILM FESTIVALU / I agree tha our film will be copied for non-commercial use in the video library of the Harvest Films and for "Echoes of LIFE SCIENCES FILM FESTIVAL', array(
            'ANO / YES',
            'NE / NO'
        ));
        $this->addSelect('agree_stated', 'Souhlasím s užitím filmu ve smyslu závěrečných ustanovení statutu festivalu a vzdáváme se nároků na jakoukoliv odměnu majitele distribučních práv a odměnu autorů za takovéto užití. / I agree that the film may be used as stated in the Regulations of LIFE SCIENCES FILM FESTIVAL and I understand that there can be no claims made respecting the fee of distribution rights and the reimbursement of the owners and authors for such use.', array(
            'ANO / YES',
            'NE / NO'
        ));
        $this->addCheckbox('agree_statut','Souhlasím se statutem LIFE SCIENCES FILM FESTIVAL / I agree with the Regulations of LIFE SCIENCES FILM FESTIVAL')
            ->addRule(Form::EQUAL, 'K přijetí přihlášky je nutné souhlasit se statutem. / Please, accept the conditions mentioned below.', true)
        ;

        $this->addSubmit('submit', 'Odeslat / Submit');







    }

    protected function prepareForm()
    {

    }




    public function onSuccess(\Nette\Application\UI\Form $form)
    {
//        $values = $form->getValues();
//        $message = new Message();
//        $message->addTo('vladimir.polak.ml@gmail.com');
//        $message->addTo('josef.rybak@gmail.com');
//        $message->from = 'Kontaktní formulář - pello.cz <no-reply@pello.cz>';
//        $message->addReplyTo($values->email, $values->name);
//        $message->subject = 'Dotaz z www.pello.cz - Kontaktní formulář';
//        $message->body = "
//Kontaktní formulář:
//
//Jméno: $values->name
//Telefon: $values->phone
//Email: $values->email
//URL: $values->page_title
//
//Zpráva:
//$values->message
//";
//
//        $message->send();
//        $this->presenter->flashMessage('Vaše zpráva byla odeslána. Děkujeme.');
//        $this->presenter->redirect('this');


    }



}