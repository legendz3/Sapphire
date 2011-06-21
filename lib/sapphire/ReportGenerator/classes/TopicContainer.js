Ext.define('ForumBrowser.TopicContainer', {
    
    extend: 'Ext.container.Container',
    
    alias: 'widget.topiccontainer',
    
    title: 'Loading...',
    
    initComponent: function(){
        Ext.apply(this, {
            layout: 'border',
            items: [tree, {
                split: true,
                height: 300,
                region: 'south',
                itemId: 'preview',
                title: 'Console',
                minHeight: 150,
                bodyPadding: 10,
                autoScroll: true,
                tpl: '<font color=\"#15317E\">Exception: <br/><br/>{message}<br/><br/>Stack: <br/><br/>{stack}</font>'
            }]
        });
        this.callParent();
    },

    afterLayout: function() {
        this.callParent();

        // IE6 likes to make the content disappear, hack around it...
        if (Ext.isIE6) {
            this.el.repaint();
        }
    },
    
    loadForum: function(rec) {
        this.tab.setText(rec.get('text'));
        var nodes = rec.get('myId');

        this.child('#grid').loadForum(nodes);
    },
    
    onSelect: function(rec) {

        this.child('#preview').update({
            message: rec.get('message'),
            stack: rec.get('stack')
        });
    },
    
    togglePreview: function(show){
        var preview = this.child('#preview');
        if (show) {
            preview.show();
        } else {
            preview.hide();
        }
    }
});