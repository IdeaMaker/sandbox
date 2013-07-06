<?php

namespace IdeaMaker\Facades;
use Nette\ArrayHash;
use Nette\DateTime;
use Nette\Diagnostics\Debugger;
use \Nette\Object;
use Nette\Database\Connection;
use Nette\Database\Table\Selection;
use Nette\Security\Identity;
use Nette\Security\User;

abstract class Facade extends Object
{
    /**
     * @var Identity
     */
    protected $identity;


    /** @var Connection */
    protected $connection;

    public function __construct(Connection $db, User $user)
    {
        $this->connection = $db;
        $this->identity = $user->getIdentity();
    }

    /**
     * Vrací objekt reprezentující databázovou tabulku.
     * @return Selection
     */
    protected function getTable()
    {
        // název tabulky odvodíme z názvu třídy
        preg_match('#(\w+)Facade$#', get_class($this), $m);
        return $this->connection->table(lcfirst($m[1]));
    }

    /**
     * Vrací všechny řádky z tabulky.
     * @return Selection
     */
    public function findAll()
    {
        return $this->getTable();
    }

    /**
     * Vrací řádky podle filtru, např. array('name' => 'John').
     * @return Selection
     */
    public function findBy(array $by)
    {
        return $this->getTable()->where($by);
    }

    public function save(ArrayHash $data)
    {
        $this->beforeSave($data);
        if (isset($data['id'])) // edit
        {
            return $this->getTable()->where(array('id'=>(int)$data['id']))->update($data);
        }
        else // new
        {
            return $this->getTable()->insert($data)->id;
        }
    }

    public function prepareCreatedAt(&$data)
    {
        $data['created_at'] = new DateTime();
    }

    public function prepareUpdatedAt(&$data)
    {
        $data['updated_at'] = new DateTime();
    }

    public function prepareCreatedBy(&$data)
    {
        $data['created_by'] = $this->identity->getId()?$this->identity->getId():NULL;
    }

    public function prepareUpdatedBy(&$data)
    {
        $data['updated_by'] = $this->identity->getId()?$this->identity->getId():NULL;
    }

    protected function beforeSave(ArrayHash &$data)
    {
        if (!$data['id']) {
            unset($data['id']);
        }

    }

    protected function isInsert(ArrayHash $data)
    {
        return  @!$data['id'];
    }

    /**
     * @param int $id
     * @return Selection
     */
    public function find($id)
    {
        return $this->getTable()->find($id);
    }

}