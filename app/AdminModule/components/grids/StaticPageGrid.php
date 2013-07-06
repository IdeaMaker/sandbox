<?php

namespace AdminModule\Components\Grids;
use Grido\Grid;
use IdeaMaker\Facades\StaticPageFacade;
use \Grido\Components\Columns\Column;
use Grido\Components\Filters\Filter;
use \Grido\Components\Actions\Action;
use Nette\Diagnostics\Debugger;

class StaticPageGrid extends Grid
{
    /**
     * @var \IdeaMaker\Facades\StaticPageFacade
     */
    protected $staticPageFacade;

    /**
     * @param \IdeaMaker\Facades\StaticPageFacade $staticPageFacade
     */
    public function __construct(StaticPageFacade $staticPageFacade)
    {
        $this->staticPageFacade = $staticPageFacade;

        $this->setModel(
            $this->staticPageFacade->findAll()->select('staticPage.*, staticPage_lang:*, staticPage.id AS sid')->where('staticPage_lang:lang', 'cs') // @todo FIX LANG
        );
        // columns
        $this->addColumn('sid', 'ID', Column::TYPE_TEXT)->setSortable();


        $this->addColumn('title', 'Titulek', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('parent_id', 'Parent', Column::TYPE_TEXT)->setSortable()->setCustomRender(function($row) use($staticPageFacade){ return ($row->parent_id) ? $staticPageFacade->getLangTable()->where('staticPage_id', $row->parent_id)->fetch()->title : 'n/a'; });

        $this->addColumn('created_at', 'Vytvořeno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('updated_at', 'Upraveno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);

        // filters
        $this->addFilter('id', 'ID', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('created_at', 'Vytvořeno', Filter::TYPE_DATE);
        $this->addFilter('updated_at', 'Upraveno', Filter::TYPE_DATE);
        $this->setFilterRenderType(Filter::RENDER_INNER);

        // actions
        $this->addAction('edit', 'Upravit', Action::TYPE_HREF)->setIcon('pencil');
        $this->addAction('delete', 'Smazat')->setIcon('trash')->setConfirm('Opravdu chcete mazat?');
        return;

        $me = $this;
        // operations
        $this->setOperations(array('delete'=>'Smazat'), function($operation, $id) use ($me) {
            $me->{"handle".$operation}($id);
        })->setConfirm("delete", 'Opravdu chcete mazat?');



        // export
        $this->setExporting('static-pages');


    }

    public function handleEdit($id)
    {

    }

    public function handleDelete($id)
    {

    }


}