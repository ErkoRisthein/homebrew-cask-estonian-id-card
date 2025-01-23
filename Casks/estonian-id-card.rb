cask 'estonian-id-card' do
  version '24.9.0.1949'
  sha256 'e9c83c37836d9d0b78d2867f978caae1bb781ffbf62e40559484f5fad400268e'

  url "https://installer.id.ee/media/osx/Open-EID_#{version}.dmg"
  name 'Electronic identity card software for Estonia'
  name 'eID Estonia'
  homepage 'https://www.id.ee/en/article/install-id-software/'

  pkg 'Open-EID.pkg'

  uninstall script: {
                      executable: 'uninstall.sh',
                      input:      ['y'],
                      sudo:       true,
                    },
            quit:   'ee.ria.TokenSigningApp'

  caveats <<~EOS
    DigiDoc4 Client and Web eID are available in the App Store:
      https://apps.apple.com/ee/developer/ria/id556524921
  EOS
end
