cask 'eid-ee' do
  version '23.7.0.194'
  sha256 'ca4afad1f2f4d5c234f3bb687b204d442b6240b570d7de6cda141ca369a3c72d'

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
