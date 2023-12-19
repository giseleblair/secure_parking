

<section class="footer footer--desktop">
    <div class="wrapper">
                {{ each navigation_settings as nav_settings where nav_settings.title = "Footer Settings"}}
                   <div class="footer__copyright">
           <a>   {{globals.footer_text.preg_replace(/YEAR/,{instance.date(Y)})}}</a>
        </div>
    <div class="footer__info">
            {{ each nav_link as link where find_in_set(link.zuid, '{nav_settings.navigation_links}') order by link.sort ASC }}  
      
        {{ $linkHref = {link.external_url_link} }}
        
                    {{ if {$linkHref} == "" }}
                    {{ $linkHref = {truepath({link.internal_url})} }}
                    {{ end-if }}
     <a href="{{$linkHref}}">{{link.title}}</a>


    {{end-each}}
        </div>

{{ end-each}}
     
    
    </div>
</section>