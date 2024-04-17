cask 'estonian-id-card' do
  version '24.4.0.1946'
  sha256 'ab186fca2922430567c351c1899f9aa62722b457a87080fcb348eeb423becf65'

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
