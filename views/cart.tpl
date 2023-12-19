 <div class="cart-container">
    <div class="cart-payment__breadcrumb hidden">
        <span></span>
        <p>Back</p>
    </div>
    <section class="cart-shared cart open" data-cart-panel="booking-overview">
        <div class="bg-white">
            <div class="wrapper">
                <div class="cart__main-wrapper active" data-cartcontext="populated" data-showid="cart">
                    <div class="cart__top-section">
                        <div class="cart__header">
                            <h2 class="cart__main-title">Cart</h2>
                            <div class="cart__clear-all">
                                <span class="text">Remove all</span><span class="icon"></span>
                            </div>
                        </div>
                        <div class="cart__items">
                            <!-- Append cart items here -->
                        </div>
                        {{ include /cart/promo-code }}
                        {{ include /cart/gift-card }}
                        {{ include /payments/bluetooth-gate }}
                    </div>
                    <div class="cart__bottom-section">
                        <div class="cart__summary-wrapper">
                            <div class="cart-details__summary">
                                <div class="cart-details__col"><span class="cart-det-title">Parking cost</span><span class="cart-det-info parking-cost">amount</span></div>
                                 <div class="cart-details__col"><span class="cart-det-title">Booking Fee</span><span class="cart-det-info booking-fee-savings">savings amount</span><span class="cart-det-info booking-fee">amount</span></div> 
                                <div class="cart-details__col"><span class="cart-det-title">Surcharge</span><span class="cart-det-info surcharge">amount</span></div> 
                            </div>
                            <div class="optional-cart-items">
                                <div class="voucher-details__summary cart-brief">
                                    <div class="voucher-details__col">
                                        <span class="voucher-title voucher-desc"></span>
                                        <span class="voucher-info voucher-amount"></span>
                                    </div>
                                </div>
                                <div class="gift-card-details__summary">
                                    <div class="gift-card-details__col">
                                       <!-- Gift card and amount here?? It is commented out on nunjucks -->
                                    </div>
                                </div> 
                            </div>
                            <div class="cart__summary">
                                <div class="cart__total"></div>
                                <div class="cart__sum"></div>
                            </div>
                        </div>
                        <div class="cart__proceed-btn">
                            <button class="cta-full">Proceed to payment</button>
                        </div>
                    </div>
                </div>
                <!-- Other States -->
                <div class="cart__main-wrapper" data-cartcontext="empty">
                    <div class="cart__header">
                        <h2 class="cart__main-title">Cart</h2>
                    </div>
                    <div class="cart__empty">
                        <div class="cart__empty-content">
                            <div class="cart__empty-title">Your cart is empty</div>
                            <a href="{{$langPrefix}}/car-parks/" class="cta-full">
                                Find a park
                            </a>
                        </div>
                    </div>
                </div>
                <div class="cart__main-wrapper" data-cartcontext="unauthorized">
                    <div class="cart__header">
                        <h2 class="cart__main-title">Cart</h2>
                    </div>
                    <div class="cart__empty">
                        <div class="cart__empty-content">
                            <div class="cart__empty-title">Please log in or register to book parking</div>
                            <div class="cta-full sign-register-link">
                                Sign in or Register
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cart__main-wrapper" data-cartcontext="error">
                    <div class="cart__header">
                        <h2 class="cart__main-title">Cart</h2>
                    </div>
                    <div class="cart__empty">
                        <div class="cart__empty-content">
                            <div class="cart__empty-title">There was an error fetching your cart, please try again or contact us for assistance</div>
                            <a class="cta-full" href="{{$langPrefix}}/contact-us/">
                                Contact Us
                            </a>
                        </div>
                    </div>
                </div>
                <div class="cart__main-wrapper" data-cartcontext="loading">
                    <div class="cart__header">
                        <h2 class="cart__main-title">Cart</h2>
                    </div>
                    <div class="cart__empty">
                        <div class="cart__empty-content">
                            <div class="cart__empty-title">Loading...</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="desktop-cart-edit">
               {{ include edit-cart-item }}
            </div>
              {{ include cart-mob-slider }}
    </section>

    <div class="cart__overlay"></div>
    {{ include /payments/cart-payment }}
    <div data-cart-panel="customer-details" class="payment-customer-form">

        {{ include account-form }}

    </div>
 {{ include /booking/booking-confirmation }}
    </div>