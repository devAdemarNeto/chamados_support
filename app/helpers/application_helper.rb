module ApplicationHelper
    def status_color_class(status)
        case status
        when 'aberto'
          'px-2 py-1 bg-green-100 text-green-800 rounded-full text-sm font-medium'
        when 'fechado'
          'px-2 py-1 bg-red-100 text-red-800 rounded-full text-sm font-medium'
        when 'em andamento'
          'px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-sm font-medium'
        else
          'px-2 py-1 bg-gray-100 text-gray-800 rounded-full text-sm font-medium'
        end
      end
      
end
