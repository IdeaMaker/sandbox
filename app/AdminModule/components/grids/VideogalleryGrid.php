<?php

namespace AdminModule\Components\Grids;
use Grido\Grid;
use IdeaMaker\Facades\VideogalleryFacade;
use \Grido\Components\Columns\Column;
use Grido\Components\Filters\Filter;
use \Grido\Components\Actions\Action;
class VideogalleryGrid extends Grid
{

    /**
     * @var VideogalleryFacade
     */
    protected $videogalleryFacade;

    /**
     * @param
     */
    public function __construct(VideogalleryFacade $staticPageFacade)
    {
        $this->videogalleryFacade = $staticPageFacade;

        $this->setModel(
            $this->videogalleryFacade->findAll()
        );

        // columns
        $this->addColumn('id', 'ID', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('url', 'URL', Column::TYPE_HREF)->setSortable();
        $this->addColumn('title', 'Titulek videa', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('is_active', 'Aktivní', Column::TYPE_TEXT)->setCustomRender(function($row){ return $row->is_active?'✓':'x';})->setSortable();


        $this->addColumn('created_at', 'Vytvořeno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('updated_at', 'Upraveno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);

        // filters
        $this->addFilter('id', 'ID', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('url', 'URL', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('title', 'Titulek videa', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('is_active', 'URL', Filter::TYPE_SELECT, array(1=>'✓', '0'=>'x'));
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
        $this->setExporting('videogallery');


    }

    public function handleEdit($id)
    {

    }

    public function handleDelete($id)
    {

    }


}