<style>
   .lds-ripple {
   position: relative;
   display: inline-block;
   width: 8rem;
   height: 8rem;
   }
   .lds-ripple div {
   position: absolute;
   opacity: 1;
   border: 4px solid #0055a5;
   border-radius: 50%;
   animation: lds-ripple 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
   }
   .lds-ripple div:nth-child(2) {
   animation-delay: -0.5s;
   }
   @keyframes lds-ripple {
   0% {
   top: 36px;
   left: 36px;
   width: 0;
   height: 0;
   opacity: 1;
   }
   100% {
   top: 0px;
   left: 0px;
   width: 72px;
   height: 72px;
   opacity: 0;
   }
   }
 
</style>
<section id="" class="content-search-results--all-parks search-widget__results" >
   <div class="loader find-park text-center" style="display:none" data-context="main">
      <div class="lds-ripple">
         <div></div>
         <div></div>
      </div>
   </div>
   <div class="search-widget__container" data-context="main">
      <div class="items">
         <div class="geocode-results"></div>
         <h3 class="search-widget__subtitle"></h3>
         <div class="carpark-results-container"></div>
      </div>
   </div>
</section>