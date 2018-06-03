require_relative '../car'

RSpec.describe Car do
    let(:car) {Car.new('2000', 'ford', 'focus se', '')}
    let(:car_over) {Car.new('2021', 'ford', 'focus se', '')}
    let(:car_under) {Car.new('1899', 'Chev', 'Imapala', 'ST')}
    let(:car_no_make) {Car.new('2021', 'fard', 'focus se', '')}
    let(:car_blank_trim) {Car.new('2021', 'chev', 'impala', 'blank')}

    it 'has a year' do
        expect(car.year).to eq '2000'
    end

    it 'has a make' do
        expect(car.make).to eq 'ford'
    end

    it 'has a model' do
        expect(car.model).to eq 'focus se'
    end

    it 'has a trim' do
        expect(car.trim).to eq ''
    end

    it 'has a predetermined list of makes' do
        expect(car.possible_makes).to eq ["Chevrolet", "Ford"]
    end

    it 'has a predetermined list of models' do
        expect(car.possible_models).to eq ["Impala", "Focus"]
    end

    it 'has a predetermined list of trims' do
        expect(car.possible_trims).to eq ['ST', 'SE']
    end

    it "updates the year if it's below 1900 or above 2 years past today's date, returns intger." do
        expect(car_over.update_year).to eq nil
        expect(car_under.update_year).to eq nil
        expect(car.update_year).to eq 2000
    end

    it "updates make, checks for name shortening, returns formatted string." do
        expect(car_no_make.update_make).to eq 'fard'
        expect(car.update_make).to eq 'Ford'
    end

    it "checks to see if model is two seperate words, if so make first word model, second word trim." do
        expect(car.check_model_word_count).to eq 'focus'
        expect(car.trim).to eq 'se'
    end

    it "updates model, checks for name shortening, returns formatted string." do
        expect(car_blank_trim.update_model).to eq 'Impala'
    end

    it "updates trim, if 'blank' return nil, else if it appears in predetermined list return string reformatted" do
        expect(car_blank_trim.update_trim).to eq nil
        expect(car_under.update_trim).to eq 'ST'
    end

    it "returns hash of normalized values placed on car" do
        expect(car.normalize_data.values).to eq [2000, 'Ford', 'Focus', 'SE']
    end
end