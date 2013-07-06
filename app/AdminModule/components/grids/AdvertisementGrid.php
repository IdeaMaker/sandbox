<?php

namespace AdminModule\Components\Grids;
use Grido\Grid;
use IdeaMaker\Facades\AdvertisementFacade;
use \Grido\Components\Columns\Column;
use Grido\Components\Filters\Filter;
use \Grido\Components\Actions\Action;
use IdeaMaker\Facades\CategoryFacade;
use IdeaMaker\Facades\PrintFacade;
use Nette\Diagnostics\Debugger;

class AdvertisementGrid extends Grid
{

    /**
     * @var AdvertisementFacade
     */
    protected $advertisementFacade;

    /**
     * @var PrintFacade
     */
    protected $printFacade;

    /**
     * @var CategoryFacade
     */
    protected $categoryFacade;

    /**
     * @param AdvertisementFacade $staticPageFacade
     * @param PrintFacade $printFacade
     * @param CategoryFacade $categoryFacade
     */
    public function __construct(AdvertisementFacade $staticPageFacade, PrintFacade $printFacade, CategoryFacade $categoryFacade)
    {
        $this->advertisementFacade = $staticPageFacade;

        $this->setModel(
            $this->advertisementFacade->findAll()
        );
        $me = $this;
        // columns
        $this->addColumn('id', 'ID', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('title', 'Titulek', Column::TYPE_TEXT)->setSortable();
//        $this->addColumn('slug', 'URL', Column::TYPE_TEXT)->setSortable();
        $this->addColumn('print_id', 'Tiskové medium', Column::TYPE_TEXT)->setColumn(function($item) {return $item->print->name;})->setSortable();
        $this->addColumn('category_id', 'Kategorie', Column::TYPE_TEXT)->setColumn(function($item) {return $item->category->name;})->setSortable();
//        $this->addColumn('category.name', 'Na')
        $this->addColumn('is_active', 'Aktivní', Column::TYPE_TEXT)->setCustomRender(function($item) {return $item->is_active ? '<i class="icon icon-ok-circle"></i>' : '<i class="icon icon-ban-circle"></i>';})->setSortable();


        $this->addColumn('published_from', 'Publikováno od', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('published_to', 'Publikováno do', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('created_at', 'Vytvořeno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);
        $this->addColumn('updated_at', 'Upraveno', Column::TYPE_DATE)->setSortable()->setDateFormat(\Grido\Components\Columns\Date::FORMAT_DATETIME);

        $this->addColumn('created_by', 'Vytvořil', Column::TYPE_TEXT)->setCustomRender(function($item) use ($me) {return '<a href="'.$me->presenter->link(':Admin:User:edit?id='.$item->created_by).'">'.$item->ref('user','created_by')->name . '</a>'; })->setSortable();

        // filters
        $this->addFilter('id', 'ID', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('title', 'Nadpis', Filter::TYPE_TEXT)->setSuggestion();

        $this->addFilter('slug', 'URL', Filter::TYPE_TEXT)->setSuggestion();
        $this->addFilter('created_at', 'Vytvořeno', Filter::TYPE_DATE);
        $this->addFilter('updated_at', 'Upraveno', Filter::TYPE_DATE);
        $this->setFilterRenderType(Filter::RENDER_INNER);

        // actions
        $this->addAction('edit', 'Upravit', Action::TYPE_HREF)->setIcon('pencil');
        $this->addAction('delete', 'Smazat')->setIcon('trash')->setConfirm('Opravdu chcete mazat?');


        // operations
        $this->setOperations(array('delete'=>'Smazat', 'activate' => 'Aktivovat', 'deactivate' => 'Deaktivovat'), function($operation, $id) use ($me) {
            $me->{"handle".$operation}($id);
        })->setConfirm("delete", 'Opravdu chcete mazat?');





        // export
        $this->setExporting('users');


    }

    public function handleActivate($id)
    {
        $this->advertisementFacade->find($id)->update(array('is_active'=>1));
    }

    public function handleDeactivate($id)
    {
        $this->advertisementFacade->find($id)->update(array('is_active'=>0));
    }

    public function handleEdit($id)
    {

    }

    public function handleDelete($id)
    {
        $this->advertisementFacade->delete($id);
    }


}