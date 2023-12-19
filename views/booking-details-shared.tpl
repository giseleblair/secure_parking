<section class="booking-details" style="display: none;">
    <div class="booking-details__code-wrapper">
        <div class="booking-details__title-wrapper">
            <div class="booking-details__title"></div>
            <div class="booking-details__share"></div>
        </div>
        <div class="booking-details__address"></div>
        <div class="booking-details__qr-container"></div>
        <div class="booking-details__pin-wrapper">
            <div class="booking-details__info">Access car park with code </div>
            <div class="booking-details__pin">PIN </div>
        </div>
    </div>
        <div class="booking-details__btn-wrapper">
        <div class="cta-full directions">
            <span class="location"></span> Get directions
        </div>
    </div>

 {{ include /car-park/car-park-entrance-img-tabs }}

<div class="booking-details__dets">
    <div class="booking-details__prod-info">
        <span class="icon"></span>
        <span class="category"></span>
    </div>
<div class="booking-details__subheading">Your current booking</div>
    <div class="cart-item__date"></div>
    <div class="cart-item__entry-info">

        <div class="cart-item__spec enter">
            <div class="cart-item__instruction">Enter after</div>
            <div class="cart-item__time"></div>
            <div class="cart-item__date-info"></div>
        </div>
        <div class="cart-item__spec exit">
            <div class="cart-item__instruction">Exit before</div>
            <div class="cart-item__time"></div>
            <div class="cart-item__date-info"></div>
        </div>
</div>

</div>

 
    <div class="cart-item__important">
        <h2>Important information</h2>
        <span class="cart-info__details"></span>
        <p class="booking-bluetooth-info"></p>
    </div>

    <div class="booking-details__summary">
        <div class="booking-details__summary-title">About your booking</div>
        <div class="booking-details__summary-rows">
            <div class="booking-details__col"><span class="bays">Bays</span><span class="price">1</span></div>
            <div class="booking-details__col"><span class="bays">Parking cost</span ><span class="parking-price"></span></div>
            <div class="booking-details__col"><span class="bays">Booking fee</span ><span class="fee-price"></span></div>
            <div class="booking-details__col"><span class="bays">Surcharge</span ><span class="surcharge"></span></div> 
            <div class="booking-details__col"> 
                <span class="bays giftcard-name"></span > 
                <span class="giftcard"></span> 
            </div> 
            <div class="booking-details__col"> 
                <span class="bays voucher-name"></span > 
                <span class="voucher"></span> 
            </div> 
        </div>
        <div class="booking-details__total"><span>Total</span><span class="cost"></span></div>

    </div>
    <a href="{{$langPrefix}}/contact-us" target="_blank">
        <div class="account-menu__tab-item account-menu__tab-item--secondary">
            <div class="account-menu__icon account-menu__icon--query"></div>
            <div class="account-menu__info">
                <div class="account-menu__title">Need Help</div>
            </div>
        </div>
    </a>
    {{ include /booking/booking-details-terms }}
    <div class="booking-details__download booking-details__download--item">
        <div class="booking-details__download-wrapper">
            <div class="booking-details__download-icon"></div>
            <h2>Download receipt</h2>
        </div>
    </div>

</section>
{{ include qr-scan }}






