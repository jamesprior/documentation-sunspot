module Documentation
  module Searchers
    class Sunspot < Documentation::Searchers::Abstract
    
      def setup
        ::Sunspot.setup(Documentation::Page) do
          text :title, :boost => 2.0
          text :content, :stored => true
          string :title, :stored => true
          string :permalink
          string :full_permalink
          time :created_at
          time :updated_at
        end
      end
      
      def index(page)
        ::Sunspot.index(page)
      end
      
      def delete(page)
        ::Sunspot.remove(page)
      end
      
      def reset
        ::Sunspot.remove_all(Documentation::Page)
      end
      
      def search(query, options = {})
        # Default options
        options[:page]      ||= 1
        options[:per_page]  ||= 15
        
        result = ::Sunspot.search(Documentation::Page) do |search|
          search.keywords query, :highlight => true
          search.paginate :page => options[:page], :per_page => options[:per_page]
        end
        
        search_result                 = Documentation::SearchResult.new
        search_result.page            = options[:page].to_i
        search_result.per_page        = options[:per_page].to_i
        search_result.total_results   = result.total
        search_result.query           = query
        search_result.time            = result.query_time
        search_result.raw_results     = result.hits.inject(Hash.new) do |hash, hit|
          hash[hit.primary_key.to_i] = {
            :score => hit.score,
            :highlights => hit.highlights(:content).collect{|x| x.format{|word| "{{{#{word}}}}"}}
          }
          hash
        end
        
        # Return it
        search_result
      end
      
    end
  end
end
