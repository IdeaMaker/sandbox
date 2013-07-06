<?php

namespace IdeaMaker\Facades;

use Nette\ArrayHash;
use Nette\Diagnostics\Debugger;
use Nette\Http\FileUpload;
use Nette\Security\Identity;

class VideogalleryFacade extends Facade
{


    protected function beforeSave(ArrayHash &$data)
    {

        if ($this->isInsert($data)) {
            $this->prepareCreatedAt($data);
        }
        $this->prepareUpdatedAt($data);
        $this->saveImage($data);

        parent::beforeSave($data);
    }

    public function delete($id)
    {
        $this->getTable()->find($id)->delete();
    }

    protected function saveImage(&$data) {

        if ($data->image->isOk()) {
            $image = clone $data->image;
            unset($data->image);
            $image->move(dirname(dirname(__DIR__)).'/web/videogalleryImages/'.$image->sanitizedName);
            $data['image'] = '/videogalleryImages/'.$image->sanitizedName;
            return true;
        }
        unset($data['image']);
        return false;
    }

}