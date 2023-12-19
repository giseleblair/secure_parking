<section class="car-park-detail booking-review">
    <div class="car-park-detail__left">
        <div class="wrapper-map-left">
            <a class="breadcrumb" href="{{$langPrefix}}/car-parks/">
                <span></span>
                <p>Back</p>
            </a>
            <h3>{{this.title}}</h3>

            {{ include /car-park/car-park-entrance-img-tabs }}
            {{ include /cart/cart-item-info }}
            {{ include /cart/cart-item-info-block }}
            {{ include /cart/cart-item-qr-access }}
            {{ include /booking/booking-details-summary }}

            <div class="add-blue-section">
                <span></span>
                <p>Add another day</p>
            </div>
            <div class="add-blue-section">
                <span></span>
                <p>Add unlimited access - $10</p>
            </div>
            <div class="cart-payment__paragraph">Price includes GST</div>

            {{ include /booking/booking-details-terms }}

        </div>
    </div>
    <div class="car-park-detail__right">
        <div class="car-park-detail__map">
            <img src="https://images.unsplash.com/photo-1478860409698-8707f313ee8b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80">
        </div>
    </div>

    {{ include /booking/booking-single-button-wrapper }}

</section>