<?php

namespace IdeaMaker\Facades;

use Nette\ArrayHash;
use Nette\Diagnostics\Debugger;
use Nette\Security\Identity;

class AdvertisementFacade extends Facade
{



    protected function beforeSave(ArrayHash &$data)
    {
        if ($this->isInsert($data)) {
            $this->prepareCreatedAt($data);
            $this->prepareCreatedBy($data);
        }
        $this->prepareUpdatedAt($data);

        parent::beforeSave($data);
    }

    public function delete($id)
    {
        $this->getTable()->find($id)->delete();
    }

}