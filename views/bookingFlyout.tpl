{{ include _env }}
<section class="booking-tabs booking-tabs--desktop site-panel" data-site-panel="booking">
    <div class="booking-details__breadcrumb booking-details__breadcrumb--desktop" style="display: none;">
        <span></span>
        <p>Back</p>
    </div>
    <div class="booking-list__breadcrumb booking-list__breadcrumb--desktop" style="display: none;position:absolute;">
        <span></span>
        <p>Back</p>
    </div>
    <div class="booking-amend__breadcrumb" style="display: none;" data-action="amend-back"> 
        <span></span> 
        <p>Back</p> 
    </div> 
    {{ include /misc/status-bar }} 
    <div class="booking-tabs__upper">
{{if {this.set_zuid} != {$bookingPageId} }}
      {{ include /booking-amend/booking-amend-container }}
      {{ include /booking-cancel/booking-cancel-container }}
      {{ include /booking-cancel/booking-partial-cancel }}
      {{ include booking-tabs-shared }}
    </div>
      {{ include booking-wrapper-buttons }}
{{else}}
      Please use the booking tabs in the main page
{{end-if}}
</section>
