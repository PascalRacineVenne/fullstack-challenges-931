class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def update(element, index)
    @elements[index] = element
    save_csv
  end

  def remove(index)
    @elements.delete_at(index)
    save_csv
  end
end
