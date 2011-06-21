var data = null;

var tree = Ext.create('Ext.tree.Panel', {
    itemId: 'grid',
    region: 'center',
    minHeight: 150,
    title: 'Test Results',
    width: 500,
    height: 300,
    collapsible: true,
    useArrows: true,
    rootVisible: false,
    autoScroll: true,
    containerScroll: true,
    store: Ext.create('Ext.data.TreeStore', {
        model: 'ForumBrowser.Topic',
        proxy: {
            type: 'ajax',
            url: 'x.json',
            reader: {
                type: 'json',
                root: 'results'
            }
        },
        folderSort: false
    }),
    multiSelect: true,
    singleExpand: false,
    columns: [{
        xtype: 'treecolumn', //this is so we know which column will show the tree
        text: 'Description',
        width: 800,
        dataIndex: 'text',
        flex: 2,
        sortable: true
    },{
        text: 'Execution Time (in seconds)',
        width: 100,
        dataIndex: 'execution_time',
        align: 'center',
        flex: 1
    }],


    loadForum: function(item){
        tree.store.proxy.url = item + ".json";
        tree.store.load();
    },

    onSelect: function(selModel, rec){
        this.ownerCt.onSelect(rec);
    }
});

tree.getSelectionModel().on({
            scope: tree,
            select: tree.onSelect
        });