package models.pivottable;

import com.avaje.ebean.Model;
import com.avaje.ebean.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
public class Field extends Model {

    @Id
    @GeneratedValue
    private Long id;

    private String fieldName;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinColumn(name = "pivot_table_id")
    @JsonIgnore
    private PivotTable pivotTable;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<PivotRow> pivotRows;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<PivotColumn> pivotColumns;

    public static Model.Finder<Long, Field> find = new Model.Finder<>(Field.class);

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public List<PivotRow> getPivotRows() {
        return pivotRows;
    }

    public void setPivotRows(List<PivotRow> pivotRows) {
        this.pivotRows = pivotRows;
    }

    public List<PivotColumn> getPivotColumns() {
        return pivotColumns;
    }

    public void setPivotColumns(List<PivotColumn> pivotColumns) {
        this.pivotColumns = pivotColumns;
    }

}