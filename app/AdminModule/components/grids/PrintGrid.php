<?php

namespace AdminModule\Components\Grids;
use Grido\Grid;
use IdeaMaker\Facades\PrintFacade;
use \Grido\Components\Columns\Column;
use Grido\Components\Filters\Filter;
use \Grido\Components\Actions\Action;
class PrintGrid extends Grid
{

    /**
     * @var PrintFacade
     */
    protected $printFacade;

    /**
     * @param PrintFacade
     */
    public function __construct(PrintFacade $staticPageFacade)
    {
        $this->printFacade = $staticPageFacade;

        $this->setModel(
            $this->printFacade->findAll()
        );

        // columns
        $this->addColumn('id', 'ID', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('name', 'Jméno', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('slug', 'URL', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('order', 'Řazení', Column::TYPE_TEXT)->setSortable();

        $this->addColumn('created_at', 'Vytvořeno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('updated_at', 'Upraveno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);

        // filters
        $this->addFilter('id', 'ID', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('name', 'Jméno', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('slug', 'URL', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('created_at', 'Vytvořeno', Filter::TYPE_DATE);
        $this->addFilter('updated_at', 'Upraveno', Filter::TYPE_DATE);
        $this->setFilterRenderType(Filter::RENDER_INNER);

        // actions
        $this->addAction('edit', 'Upravit', Action::TYPE_HREF)->setIcon('pencil');
        $this->addAction('delete', 'Smazat')->setIcon('trash')->setConfirm('Opravdu chcete mazat?');

        $me = $this;
        // operations
        $this->setOperations(array('delete'=>'Smazat'), function($operation, $id) use ($me) {
            $me->{"handle".$operation}($id);
        })->setConfirm("delete", 'Opravdu chcete mazat?');



        // export
        $this->setExporting('users');


    }

    public function handleEdit($id)
    {

    }

    public function handleDelete($id)
    {

    }


}