/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.skin = 'moono-color',
    config.extraPlugins = 'filebrowser',
    config.filebrowserBrowseUrl = '/browser/browse.php',
    config.filebrowserUploadUrl = '/uploader/upload.php'
    //config.codeSnippet_theme = 'monokai_sublime',
    //config.toolbar = [
    //	['Source'], ['Undo', 'Redo'], ['Bold', 'Italic', 'Underline'], ['CodeSnippet']
    //]
};
