class UserInteractions
  def initialize(filename)
    lines = IO.readlines(filename).map(&:chomp)
    @interactions = {} # key is sender; unique values are the receivers
    find_interactions lines
  end

  def to_s
    return_value = ''
    @interactions.each do |sender, receivers|
      return_value += "#{sender}: #{receivers}\n"
    end
    return_value
  end

  def [](key)
    @interactions[key]
  end

  def each
    @interactions.each do |key, value|
      yield(key, value) if block_given?
    end
  end

  private

  def find_interactions(lines)
    lines.each do |line|
      split_line = line.split(/\s{4}/)
      @interactions[split_line[1]] = [] unless @interactions[split_line[1]]
      @interactions[split_line[1]] << split_line[2]  
    end
    unique_interactions
  end

  def unique_interactions
    @interactions.each do |sender, receivers|
      receivers.uniq!
    end
  end
end

class Clusters
  attr_reader :clusters

  def initialize(relationships)
    @relationships = relationships
    find_clusters
    filter_sub_clusters
  end

  def to_s
    @clusters.to_s
  end

  def formatted_print
    sort_clusters
  end

  private

  def find_clusters
    @clusters = []
    @relationships.each do |sender, receivers|
      receivers.size.times do |index|
        puts "Sender: #{sender}"

        receivers.permutation(index + 1).to_a.each do |perm|
          @clusters << Cluster.new([sender, perm].flatten) if all_mutual?(sender, perm)
        end
      end
    end
    @clusters.uniq! { |cluster| cluster.cluster }
  end

  def mutual?(sender, receiver)
    @relationships[receiver].include? sender
  end

  def all_mutual?(sender, receivers)
    all_mutual = true
    receivers.each do |receiver|
      all_mutual &&= mutual?(sender, receiver)
      break unless all_mutual
    end
    all_mutual
  end

  def filter_sub_clusters
    copy_of_clusters = @clusters.map.to_a
    copy_of_clusters.each do |cluster|
      @clusters.delete(cluster) if is_sub_cluster?(cluster)
    end
  end

  def is_sub_cluster?(test_cluster)
    is_sub_cluster = false
    clusters_plus_1 = @clusters.select { |cluster| cluster.size == test_cluster.size + 1 }
    clusters_plus_1.each do |cluster|
      is_sub_cluster = (test_cluster - cluster).empty?
      break if is_sub_cluster
    end
    is_sub_cluster
  end

  def sort_clusters
    @clusters.sort
  end
end

class Cluster
  attr_reader :cluster

  def initialize(cluster)
    @cluster = cluster.sort
  end

  def size
    @cluster.size
  end

  def -(other)
    cluster - other.cluster
  end

  def <=>(other)
    if size == other.size
      to_s <=> other.to_s
    else
      size <=> other.size
    end
  end

  def to_s
    cluster.join(', ')
  end
end

user_interactions = UserInteractions.new('input.txt')
# puts user_interactions
# p user_interactions['a@facebook.com']

clusters = Clusters.new(user_interactions)
clusters.clusters.each do |cluster|
  puts cluster
end

clusters.formatted_print












