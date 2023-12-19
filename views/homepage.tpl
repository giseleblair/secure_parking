<section class="home">
   {{ each home_banner as banner) }}
   <section class="homepage-banner">
      <div class="homepage-banner__img-wrapper" style="overflow:visible; max-height: none;">
         <div class="homepage-banner__img-container">
            {{if {banner.banner_img.getImage()} != ''}} 
            <picture>
               <source srcset="{{banner.banner_img.getImage()}}?width=700" media="(max-width: 599px)" />
               <source srcset="{{banner.banner_img.getImage()}}?width=1400" media="(min-width: 600px)" />
               <img src="{{banner.banner_img.getImage()}}?width=700" alt="home banner image"/>
            </picture>
            {{end-if}} 
         </div>
         <div class="homepage-banner__search-wrapper">
            <div class="wrapper">
               <h2>Hello<span class="user-first-name"></span>, 
                  <br>
                  {{banner.banner_title}}
               </h2>
               <div class="homepage-banner__input-wrapper search-park-input__search">
                  <span class="homepage-banner__icon"></span>
                  <input placeholder="Search for city, address or business" class="find-park-input" style="position: relative;" data-context="main">
                  <div class="results"> </div>
                  <section class="parks-results" data-searchshowid="autocomplete-results-desktop">
                     <div class="loader parks text-center" style="display:none">
                        <div class="lds-ripple">
                           <div></div>
                           <div></div>
                        </div>
                     </div>
                     <section class="content-search-results--all-parks search-widget__results homepage-banner__search-results">
                        <div class="loader find-park text-center" style="display: none;" data-context="main">
                           <div class="lds-ripple">
                              <div></div>
                              <div></div>
                           </div>
                        </div>
                        <div class="search-widget__container" data-context="main">
                           <div class="items">
                              <div class="geocode-results"></div>
                              <div class="carpark-results-container"></div>
                              <div> 
                              </div>
                              <div> 
                              </div>
                           </div>
                        </div>
                     </section>
                  </section>
               </div>
            </div>
         </div>
      </div>
   </section>
   {{ end-each }}

   {{ include /homepage/links-component }}

     {{if {this.featured_item_title} != ''}}
   {{ include /homepage/homepage-featured-article }}
     {{ end-if }}
  
      {{if {this.related_home_offers} != ''}}
   {{ include /homepage/homepage-content-tiles }}
      {{ end-if }}
      
   {{ include /homepage/homepage-bookings }}

      {{if {this.related_home_events} != ''}}
   {{ include /homepage/homepage-events-tiles }}
      {{ end-if }}
 
      {{if {this.products_title} != ''}}
   {{ include /homepage/homepage-products }}
      {{ end-if }}

</section>

<style>
   .lds-ripple div {
   border: 4px solid #0055a5;
   }
</style>