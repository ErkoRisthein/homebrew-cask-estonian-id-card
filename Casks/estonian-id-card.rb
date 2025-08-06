cask 'estonian-id-card' do
  version '25.5.0.1954'
  sha256 '1ceef9fa6ae4146275578322e2244fdc745d917e9042a9f92bedb1e36fd9a9a5'

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
