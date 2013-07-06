<?php

namespace IdeaMaker\Facades;

use Nette\ArrayHash;
use Nette\Diagnostics\Debugger;
use Nette\Security\Identity;

class UserFacade extends Facade
{


    protected function beforeSave(ArrayHash &$data)
    {

        if ($this->isInsert($data)) {
            $this->prepareCreatedAt($data);
        }
        $this->prepareUpdatedAt($data);
        $data['password'] = $this->hashPassword($data['password']);
        parent::beforeSave($data);
    }

    public function delete($id)
    {
        $this->getTable()->find($id)->update(array('is_deleted'=> 1));
    }

    public function hashPassword($password)
    {
        return sha1('asdfasdfasdfasf'.$password);
    }




}