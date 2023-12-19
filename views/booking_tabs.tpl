<section class="booking-tabs booking-tabs--mobile open" data-site-panel="amend-payment">
<a class="booking-details__breadcrumb booking-details__breadcrumb--mobile" style="display: none;" href="{{$langPrefix}}/account/bookings">
        <span></span>
        <p>Back</p>
    </a>
        <div class="booking-amend__breadcrumb" style="display: none;" data-action="amend-back">
        <span></span>
        <p>Back</p>
    </div>
      {{ include /booking-amend/booking-amend-container }}
      {{ include /booking-cancel/booking-cancel-container }}
      {{ include /booking-cancel/booking-partial-cancel }}
      {{ include booking-tabs-shared }}
      {{ include booking-wrapper-buttons }}
</section>

<style>
      .lds-ripple div {
border: 4px solid #0055a5;
      }
</style>