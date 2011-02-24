class LandingController < ApplicationController
  def index
    @sub_categories = ['Web Development', 'Desktop Development', 'Corporate Website', 'iPhone/iPad Application',
                       'ERP Deployment', 'Business Intelligence', 'Content Management',
                       'VPN Setup', 'Firewall&Security Setup', 'LAN/Wireless Network Setup',
                       'Software Developers', 'Web/UI Designers']
  end
end