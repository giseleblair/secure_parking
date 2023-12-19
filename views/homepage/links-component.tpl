   <section class="links-component">
      <div class="wrapper">
         <div class="links-component__sections">
            {{ each navigation_settings as nav_settings where nav_settings.title = "Homepage Links"}}
            {{ each nav_link as link where find_in_set(link.zuid, '{nav_settings.navigation_links}') order by link.sort ASC }}     
                 {{ $linkHref = {link.external_url} }}
                    {{ if {$linkHref} == "" }}
                    {{ $linkHref = {truepath({link.internal_url})} }}
                    {{ end-if }}              
            <a href="{{$linkHref}}{{link.query_string}}">
               <div class="links-component__item">
                  <div class="links-component__icon links-component__icon--all-parks"      {{if {link.link_icon.getImage()} != ''}}  style="background-image: url('{{link.link_icon.getImage()}}');" {{end-if}} >
               </div>
               <div class="links-component__info">
                  <div class="links-component__title">{{link.title}}</div>
               </div>
         </div>
         </a>
         {{end-each}}
         {{ end-each}}
      </div>
      </div>
   </section>