Ext.define('ForumBrowser.Forum', {
    extend: 'Ext.data.Model',
    fields: ['myId', 'text', 'results']
});

Ext.define('ForumBrowser.Topic', {
    extend: 'Ext.data.Model',
    fields: ['text', 'execution_time', 'type', 'results', 'message', 'stack']
});
