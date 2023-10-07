Pod::Spec.new do |s|
    openssl_version   = "1.1.1l"
    openssl_targets   = "ios-sim-cross-x86_64 ios-sim-cross-arm64 ios64-cross-arm64 ios64-cross-arm64e"
    script_version    = "11"

    s.name            = "OpenSSL-Apple"
    s.version         = "#{openssl_version}.#{script_version}"
    s.summary         = "A script for compiling OpenSSL for Apple Devices"
    s.authors         = "Felix Schulze", "Davide De Rosa", "Ezat Hashim"

    s.homepage        = "https://github.com/keeshux/openssl-apple.git"
    s.source          = { :git => s.homepage.to_s, :tag => "v#{script_version}" }
    s.license         = { :type => 'Apache', :file => 'LICENSE' }

    s.prepare_command = <<-CMD
./build-libssl.sh --version="#{openssl_version}" --targets="#{openssl_targets}"
./create-openssl-framework.sh dynamic
    CMD

    s.ios.deployment_target         = "12.0"
    s.osx.deployment_target         = "10.15"
    s.vendored_frameworks           = "frameworks/openssl.xcframework"
    s.requires_arc                  = false
end
