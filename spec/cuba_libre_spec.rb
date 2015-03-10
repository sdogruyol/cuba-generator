require 'cuba/libre'

describe Cuba::Libre do
  subject { Cuba::Libre.new('myProject') }

  it 'create_dir' do
    expect(Dir).to receive(:mkdir)
    subject.create_dir
  end

  it 'create_config_file' do
    expect(File).to receive(:open).with('./myproject/config.ru', 'w+')
    subject.create_config_file
  end

  it 'create_cuba_file' do
    expect(File).to receive(:open).with('./myproject/myproject.rb', 'w+')
    subject.create_cuba_file
  end
end
