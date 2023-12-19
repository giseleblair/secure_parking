{{ include _env }}
<section class="account-menu account-menu--desktop site-panel" data-site-panel="account">
    <div class="account-menu-overlay"></div>
    <div class="account-back breadcrumb desktop" style="display: none;">
        <span></span>Back</div>
    <div class="cards-menu breadcrumb" style="display: none;">
        <span></span>Back</div>
    <div class="payment-methods breadcrumb" style="display: none;">
        <span></span>Back</div>
    <div class="vehicles breadcrumb" style="display: none;">
        <span></span>Back</div>
    <div class="vehicles-item breadcrumb" style="display: none;">
        <span></span>Back</div>
    <div class="add-new-vehicle breadcrumb" style="display: none;">
        <span></span>Back</div>

        {{ include /misc/status-bar }}

    <section class="account-preferences account-preferences--sidebar" data-account-section="account-preferences">
        <div class="wrapper">
            <div class="breadcrumb">
                <span></span>
                <p>Back</p>
            </div>
            {{if {this.set_zuid} != {$userPreferencesPageId} }}
                {{ include shared-user-preferences }}
            {{else}}                            
                <div class="booking-tabs__guest-title">Please use the account preferences form in page.</div>
            {{end-if}}
            
        </section>      
        <div class="account-menu__upper">

            <section class="account-form account-form--sidebar" data-account-section="personal-details">
                <div class="wrapper">
                    <div class="breadcrumb">
                        <span></span>
                        <p>Back</p>
                    </div>
                    <h2 class="account-menu__main-title">Personal Details</h2>
                    {{if {this.set_zuid} != {$personalDetailsPageId} }}

                    {{ include account-form }}

                    {{else}}
                    
                    Please use the form in the main page
                    {{end-if}}
                </section>

                <section class="account-form account-form--sidebar">
                    <div class="wrapper">
                        <div class="breadcrumb">
                            <span></span>
                            <p>Back</p>
                        </div>
                        {{ include /alerts/success-alert }}
                        {{ include account-form }}
                    </section>

                    <div class="account-manage-cards">
                        {{ include /payments/review-payment }}
                        {{ include /account/edit-card }}
                        {{ include /account/add-card }}
                    </div>
                             
                    {{ include /vehicles/vehicles-list }}
               

                    <div class="wrapper">
                        <h2 class="account-menu__main-title account-title-sidebar">Account</h2>
                        {{ include /misc/loader }}
                        <div class="account-menu__tabs">
                            <div class="account-menu__tab-item details guest">
                                <div class="account-menu__icon account-menu__icon--account"></div>
                                <div class="account-menu__info">

                                    <div class="account-menu__title guest sign-register-link">Register or sign in</div>
                                </div>
                            </div>

                           

                            <a href="{{$langPrefix}}/account/personal-details" class="logged-in">
                                <div class="account-menu__tab-item details">
                                    <div class="account-menu__icon account-menu__icon--account"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Personal Details</div>
                                        <div class="account-menu__subtitle">Name, saved addresses, password</div>
                                    </div>
                                </div>
                            </a>

                            <a href="{{$langPrefix}}/account/vehicles" class="logged-in">
                                <div class="account-menu__tab-item vehicles">
                                    <div class="account-menu__icon account-menu__icon--vehicle"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Vehicles</div>
                                    </div>
                                </div>
                            </a>
                            <a href="{{$langPrefix}}/account/bookings" class="logged-in">
                                <div class="account-menu__tab-item bookings">
                                    <div class="account-menu__icon account-menu__icon--booking"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Bookings</div>
                                    </div>
                                </div>
                            </a>
                            <a href="{{$langPrefix}}/account/payment-methods" class="logged-in">
                                <div class="account-menu__tab-item payment-method">
                                    <div class="account-menu__icon account-menu__icon--payment"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Payment Methods</div>
                                    </div>
                                </div>
                            </a>
                        
                            <a href="{{$langPrefix}}/account/receipt-activity" class="logged-in">
                                <div class="account-menu__tab-item receipts">
                                    <div class="account-menu__icon account-menu__icon--payment"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Activity Statement</div>
                                    </div>
                                </div>
                            </a>
                            <a href="{{$langPrefix}}/account/preferences" class="logged-in">
                                <div class="account-menu__tab-item preferences">
                                    <div class="account-menu__icon account-menu__icon--preferences"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Preferences</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="account-menu__lower">
                    <div class="wrapper">
                        <h3>General</h3>
                        <div class="account-menu__tabs">
                            <a href="{{$langPrefix}}/contact-us">
                                <div class="account-menu__tab-item account-menu__tab-item--secondary">
                                    <div class="account-menu__icon account-menu__icon--help"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Help</div>
                                    </div>
                                </div>
                            </a>
                            <a href="{{$langPrefix}}/about/stuff-to-know/">
                                <div class="account-menu__tab-item account-menu__tab-item--secondary">
                                    <div class="account-menu__icon account-menu__icon--file"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">Legal</div>
                                    </div>
                                </div>
                            </a>
                            <a href="" class="logged-in">
                                <div class="account-menu__tab-item account-menu__tab-item--secondary logout">
                                    <div class="account-menu__icon account-menu__icon--signout"></div>
                                    <div class="account-menu__info">
                                        <div class="account-menu__title">
                                            <button type="button" class="btn btn-success">Sign Out<button></div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    

                </section>

