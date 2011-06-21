

module Sapphire
  module DataAbstractions
    class Database

      def Open(connection_string)
        @connection = WIN32OLE.new('ADODB.Connection')
        @connection.Open(connection_string)
      end

      def query(sql)
        recordset = WIN32OLE.new('ADODB.Recordset')
        recordset.Open(sql, @connection, 0 , 1)

        fields = []

        recordset.Fields.each do |field|
            fields << field.Name
        end
        begin
            recordset.MoveFirst
            data = recordset.GetRows
        rescue
            data = []
        end

        if(recordset.State != 0)
          recordset.Close
        end

        data = data.transpose
        records = []

        data.each do |row|
          y = 0
          record = Hash.new
          row.each do |column|
            if(column != nil)
              record.store fields[y].underscore.intern, column.to_s
            else
              record.store fields[y].underscore.intern, column
            end
            y += 1
          end
          records << record
        end
        records
      end

      def close
        @connection.Close
      end
    end
  end
end

