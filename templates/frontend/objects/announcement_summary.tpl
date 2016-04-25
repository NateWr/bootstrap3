{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
<article class="obj_announcement_summary">
	<h2 class="media-heading">
		<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
			{$announcement->getLocalizedTitle()|escape}
		</a>
	</h2>
	<div class="media-body">
		<div class="date">{$announcement->getDatePosted()}</div>
		{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
	</div>
</article>
