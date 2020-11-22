package ru.bellintegrator.bokhanpractice.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@Table(name = "Document")
public class Document {
    @Id
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    private User user;

    @Version
    private Integer version;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doc_type_id")
    private DocumentType Type;

    @Column(name = "doc_number", length = 15, nullable = false)
    private String Number;

    @Column(name = "doc_date")
    private LocalDate Date;
}
