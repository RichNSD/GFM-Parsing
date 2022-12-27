# -*- coding: utf-8 -*-

require 'rubygems'
require 'github-markdown-server'	'~> 1.0', '>= 1.0.1'
require 'github-markdown-preview',	'~> 4.0'
require 'github-markdown',			'= 0.6.9'
require 'github-linguist',			'= 5.0.4'
require 'commonmarker',				'~> 0.23.4'
require 'gemoji',					'= 3.0.0'
require 'html-pipeline',			'= 2.7.1'
require 'listen',					'= 3.1.5'
require 'sanitize',					'~> 5.2.1'
require 'cgi',						'>= 0'
require 'charlock_holmes',			'~> 0.7.7'
require 'mini_mime',				'~> 1.0'
require 'rugged',					'~> 1.0'


# create a preview, which writes the source_file.md.html file to disk
preview = GithubMarkdownPreview::HtmlPreview.new('source_file.md')

# you can also configure your preview with a couple of options
preview = GithubMarkdownPreview::HtmlPreview.new('source_file.md', {
    :delete_on_exit => true, # delete the preview when the program exits
   # :comment_mode => true, # render using the rules for Github comments/issues
   # :preview_file => 'gfm-preview.html' # rather than the default 'source_file.md.html'
})

# access the preview information
preview.source_file # returns 'source_file.md'
preview.preview_file # returns 'source_file.md.html'

# explicitly update the preview file from the source
preview.update

# watch the source file and update the preview on change
preview.watch # non-blocking watch
preview.watch! # blocking watch

# add a callback to be fired on update; add multiple listeners by calling again
preview.update { puts 'Preview updated!' }

# stop watching the file (only applies to non-blocking watch method)
preview.end_watch

# delete the preview file from disk
preview.delete